DROP TRIGGER IF EXISTS on_auth_user_confirmed_grant_admin ON auth.users;
CREATE TRIGGER on_auth_user_confirmed_grant_admin
AFTER INSERT OR UPDATE OF email_confirmed_at ON auth.users
FOR EACH ROW EXECUTE FUNCTION public.grant_allowlisted_admin();

DROP TRIGGER IF EXISTS lomba_pendaftaran_kuota ON public.lomba_pendaftaran;
CREATE TRIGGER lomba_pendaftaran_kuota
BEFORE INSERT OR UPDATE OF status, kategori ON public.lomba_pendaftaran
FOR EACH ROW EXECUTE FUNCTION public.lomba_cek_kuota();